from flask import Flask, render_template
import random

app = Flask(__name__)

rain_images = [
    ("rain1.jpg", "Täna oled habemeta Rain!"),
    ("rain2.jpg", "Täna oled IT Rain!"),
    ("rain3.jpg", "Täna oled lauamängu Rain!"),
    ("rain4.jpg", "Täna oled rõõmus Rain!")
]

@app.route('/')
def home():
    img, caption = random.choice(rain_images)
    return render_template("index.html", image_file=img, caption=caption)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
