load("render.star", "render")
load("time.star", "time")

def main(config):
    # 5 cold drinks and martini (Part 3)
    drinks = [
        {
            "name": "ICED LATTE",
            "cup": [" ___", "|o*o|", " |_|"],
            "color": "#D2B48C",
        },
        {
            "name": "COLD BREW",
            "cup": [" ___", "|*.*|", " |_|"],
            "color": "#2F4F4F",
        },
        {
            "name": "NITRO",
            "cup": [" ___", "|*.*|", " |_|"],
            "color": "#708090",
        },
        {
            "name": "FREDDO",
            "cup": [" ___", "|*.*|", " |_|"],
            "color": "#5F9EA0",
        },
        {
            "name": "MARTINI",
            "cup": ["  Y ", " /_\\", ""],
            "color": "#4B3621",
        },
    ]

    # Create frames for animation
    frames = []

    for drink in drinks:
        frame = render.Box(
            color = "#1a0f00",
            child = render.Box(
                # Full border around all sides
                width = 64,
                height = 32,
                color = drink["color"],
                padding = 2,
                child = render.Box(
                    color = "#1a0f00",
                    child = render.Column(
                        expanded = True,
                        main_align = "space_evenly",
                        cross_align = "center",
                        children = [
                            # Spacer
                            render.Box(height = 1),
                            # Drink name
                            render.Text(
                                content = drink["name"],
                                color = drink["color"],
                                font = "tom-thumb",
                            ),
                            # Cup with coffee beans on the right
                            render.Row(
                                main_align = "center",
                                cross_align = "center",
                                children = [
                                    # Cup ASCII art
                                    render.Column(
                                        cross_align = "center",
                                        children = [
                                            render.Text(
                                                content = drink["cup"][0],
                                                color = "#FFDEAD",
                                                font = "tom-thumb",
                                            ),
                                            render.Text(
                                                content = drink["cup"][1],
                                                color = "#FFDEAD",
                                                font = "tom-thumb",
                                            ),
                                            render.Text(
                                                content = drink["cup"][2],
                                                color = "#FFDEAD",
                                                font = "tom-thumb",
                                            ),
                                        ],
                                    ),
                                    # Spacer
                                    render.Box(width = 2),
                                    # Coffee beans on the right
                                    render.Column(
                                        cross_align = "center",
                                        children = [
                                            render.Text(
                                                content = "o",
                                                color = "#5C4033",
                                                font = "tom-thumb",
                                            ),
                                            render.Text(
                                                content = "o",
                                                color = "#5C4033",
                                                font = "tom-thumb",
                                            ),
                                            render.Text(
                                                content = "o",
                                                color = "#5C4033",
                                                font = "tom-thumb",
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ],
                    ),
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
