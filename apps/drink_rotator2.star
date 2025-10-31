load("render.star", "render")
load("time.star", "time")

def main(config):
    # 5 different drinks
    drinks = [
        {
            "name": "FREDDO ESPRESSO",
            "lines": ["FREDDO", "ESPRESSO"],
            "color": "#06FFA5",
        },
        {
            "name": "ESPRESSO MARTINI",
            "lines": ["ESPRESSO", "MARTINI"],
            "color": "#FFFFFF",
        },
        {
            "name": "AFFOGATO",
            "lines": ["AFFOGATO"],
            "color": "#FB5607",
        },
        {
            "name": "ICED COFFEE",
            "lines": ["ICED", "COFFEE"],
            "color": "#8338EC",
        },
        {
            "name": "CORTADO",
            "lines": ["CORTADO"],
            "color": "#FFBE0B",
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
