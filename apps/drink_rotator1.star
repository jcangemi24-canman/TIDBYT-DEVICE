load("render.star", "render")
load("time.star", "time")

def main(config):
    # 5 coffee drinks
    drinks = [
        {
            "name": "DOUBLE ESPRESSO",
            "lines": ["DOUBLE", "ESPRESSO"],
            "color": "#FF6B35",
        },
        {
            "name": "COLD BREW",
            "lines": ["COLD", "BREW"],
            "color": "#4ECDC4",
        },
        {
            "name": "AMERICANO",
            "lines": ["AMERICANO"],
            "color": "#F7B801",
        },
        {
            "name": "ICED LATTE",
            "lines": ["ICED", "LATTE"],
            "color": "#C77DFF",
        },
        {
            "name": "ESPRESSO MARTINI",
            "lines": ["ESPRESSO", "MARTINI"],
            "color": "#FFFFFF",
        },
    ]

    # Create frames for animation
    frames = []

    for drink in drinks:
        # Build text children based on lines
        text_children = []
        for line in drink["lines"]:
            text_children.append(
                render.Text(
                    content = line,
                    color = drink["color"],
                    font = "6x13",
                )
            )

        frame = render.Box(
            width = 64,
            height = 32,
            color = drink["color"],
            padding = 2,
            child = render.Box(
                color = "#000000",
                child = render.Column(
                    expanded = True,
                    main_align = "center",
                    cross_align = "center",
                    children = text_children,
                ),
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 3000,  # 3 seconds per drink
        child = render.Animation(
            children = frames,
        ),
    )
