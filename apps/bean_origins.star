load("render.star", "render")
load("time.star", "time")

def main():
    # Coffee-growing regions with flavor profiles
    origins = [
        {"region": "ETHIOPIA", "emoji": "🌸", "flavor": "Fruity & Floral", "color": "#FF69B4"},
        {"region": "COLOMBIA", "emoji": "🍯", "flavor": "Balanced & Sweet", "color": "#FFD700"},
        {"region": "BRAZIL", "emoji": "🍫", "flavor": "Nutty & Chocolatey", "color": "#8B4513"},
        {"region": "KENYA", "emoji": "🍊", "flavor": "Bright & Citrus", "color": "#FF8C00"},
        {"region": "GUATEMALA", "emoji": "☕", "flavor": "Rich & Cocoa", "color": "#654321"},
        {"region": "SUMATRA", "emoji": "🌿", "flavor": "Earthy & Bold", "color": "#556B2F"},
        {"region": "COSTA RICA", "emoji": "✨", "flavor": "Clean & Crisp", "color": "#87CEEB"},
        {"region": "YEMEN", "emoji": "🌶️", "flavor": "Spiced & Complex", "color": "#DC143C"},
        {"region": "JAMAICA", "emoji": "🏝️", "flavor": "Smooth & Mild", "color": "#20B2AA"},
        {"region": "HAWAII", "emoji": "🌺", "flavor": "Delicate & Smooth", "color": "#FF1493"},
    ]

    # Cycle through origins every 5 seconds
    now = time.now()
    origin_index = (now.unix // 5) % len(origins)
    current = origins[origin_index]

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#2d1b00",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Top border
                    render.Box(
                        width = 64,
                        height = 1,
                        color = current["color"],
                    ),
                    # Region name
                    render.Text(
                        content = current["region"],
                        color = "#FFDEAD",
                        font = "tom-thumb",
                    ),
                    # Emoji
                    render.Text(
                        content = current["emoji"],
                        font = "6x13",
                    ),
                    # Flavor profile
                    render.Text(
                        content = current["flavor"],
                        color = current["color"],
                        font = "tom-thumb",
                    ),
                    # Bottom border
                    render.Box(
                        width = 64,
                        height = 1,
                        color = current["color"],
                    ),
                ],
            ),
        ),
    )
