load("render.star", "render")
load("time.star", "time")

def main():
    now = time.now()

    # Animated steam patterns that cycle every 500ms
    steam_patterns = [
        "~  ~  ~",
        " ~ ~ ~ ",
        "  ~  ~ ",
        " ~  ~ ~",
    ]

    # Cycle through steam animations
    steam_index = (now.unix * 2) % len(steam_patterns)  # Changes every 500ms
    steam = steam_patterns[steam_index]

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#2d1b00",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Steam animation
                    render.Text(
                        content = steam,
                        color = "#D3D3D3",
                        font = "tom-thumb",
                    ),
                    # Another steam layer
                    render.Text(
                        content = steam,
                        color = "#C0C0C0",
                        font = "tom-thumb",
                    ),
                    # Coffee cup emoji
                    render.Text(
                        content = "☕",
                        font = "6x13",
                    ),
                    # Label
                    render.Text(
                        content = "FRESH BREWED",
                        color = "#FFD700",
                        font = "tom-thumb",
                    ),
                ],
            ),
        ),
    )
