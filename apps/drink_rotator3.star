load("render.star", "render")
load("time.star", "time")

def main(config):
    # 5 cold drinks and martini (Part 3)
    drinks = [
        {
            "name": "ICED LATTE",
            "color": "#D2B48C",
        },
        {
            "name": "COLD BREW",
            "color": "#2F4F4F",
        },
        {
            "name": "NITRO",
            "color": "#708090",
        },
        {
            "name": "FREDDO",
            "color": "#5F9EA0",
        },
        {
            "name": "MARTINI",
            "color": "#4B3621",
        },
    ]

    # Create frames for animation
    frames = []

    for drink in drinks:
        frame = render.Box(
            width = 64,
            height = 32,
            color = "#000000",
            child = render.Column(
                expanded = True,
                main_align = "center",
                cross_align = "center",
                children = [
                    render.Text(
                        content = drink["name"],
                        color = drink["color"],
                        font = "6x13",
                    ),
                ],
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 3000,  # 3 seconds per drink
        child = render.Animation(
            children = frames,
        ),
    )
