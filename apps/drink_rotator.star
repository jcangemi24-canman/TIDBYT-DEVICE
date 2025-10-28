load("render.star", "render")
load("time.star", "time")

def main():
    # 12 different coffee drinks with emojis and color themes
    drinks = [
        {"name": "ESPRESSO", "emoji": "☕", "color": "#8B4513"},
        {"name": "CAPPUCCINO", "emoji": "☕", "color": "#D2691E"},
        {"name": "LATTE", "emoji": "🥛", "color": "#F5DEB3"},
        {"name": "AMERICANO", "emoji": "☕", "color": "#654321"},
        {"name": "MACCHIATO", "emoji": "☕", "color": "#A0522D"},
        {"name": "MOCHA", "emoji": "🍫", "color": "#3B2F2F"},
        {"name": "FLAT WHITE", "emoji": "☕", "color": "#DEB887"},
        {"name": "CORTADO", "emoji": "☕", "color": "#CD853F"},
        {"name": "ESPRESSO MARTINI", "emoji": "🍸", "color": "#4B3621"},
        {"name": "FREDDO ESPRESSO", "emoji": "🧊", "color": "#5F9EA0"},
        {"name": "COLD BREW", "emoji": "🧊", "color": "#2F4F4F"},
        {"name": "NITRO COLD", "emoji": "🧊", "color": "#708090"},
    ]

    # Cycle through drinks every 5 seconds
    now = time.now()
    drink_index = (now.unix // 5) % len(drinks)
    current_drink = drinks[drink_index]

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#1a0f00",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Top decoration
                    render.Box(
                        width = 64,
                        height = 2,
                        color = current_drink["color"],
                    ),
                    # Emoji
                    render.Text(
                        content = current_drink["emoji"],
                        font = "6x13",
                    ),
                    # Drink name
                    render.Text(
                        content = current_drink["name"],
                        color = current_drink["color"],
                        font = "tom-thumb",
                    ),
                    # Bottom decoration
                    render.Box(
                        width = 64,
                        height = 2,
                        color = current_drink["color"],
                    ),
                ],
            ),
        ),
    )
