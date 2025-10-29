load("render.star", "render")

def main(config):
    # Coffee-growing regions with flavor profiles (limited to 5 for animation frames)
    origins = [
        {"region": "ETHIOPIA", "flavor": "Fruity Floral", "color": "#FF69B4"},
        {"region": "COLOMBIA", "flavor": "Balanced Sweet", "color": "#FFD700"},
        {"region": "BRAZIL", "flavor": "Nutty Chocolate", "color": "#8B4513"},
        {"region": "KENYA", "flavor": "Bright Citrus", "color": "#FF8C00"},
        {"region": "SUMATRA", "flavor": "Earthy Bold", "color": "#556B2F"},
    ]

    frames = []
    for origin in origins:
        frame = render.Box(
            color = origin["color"],
            padding = 1,
            child = render.Box(
                color = "#2d1b00",
                child = render.Column(
                    expanded = True,
                    main_align = "center",
                    cross_align = "center",
                    children = [
                        # Region name
                        render.Text(
                            content = origin["region"],
                            color = "#FFDEAD",
                            font = "tom-thumb",
                        ),
                        # Coffee beans decoration
                        render.Text(
                            content = "o  o  o",
                            color = "#5C4033",
                            font = "tom-thumb",
                        ),
                        # Flavor profile
                        render.Text(
                            content = origin["flavor"],
                            color = origin["color"],
                            font = "tom-thumb",
                        ),
                    ],
                ),
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 3000,  # 3 seconds per region
        child = render.Animation(
            children = frames,
        ),
    )
