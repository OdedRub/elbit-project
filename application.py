import requests
from datetime import datetime, timedelta
from flask import Flask, render_template, request

application = Flask(__name__, template_folder='templates')


@application.route('/', methods=['POST', 'GET'])
def form():
    if request.method == 'GET':
        current_date = datetime.now()  # get current time
        start_date = current_date  # set start time
        end_date = start_date + timedelta(days=90)  # set end time, adds 90 days to start time
        start = start_date.strftime("%Y-%m-%d")  # format start time to API requirements
        end = end_date.strftime("%Y-%m-%d")  # format end time to API requirements
        response = requests.get(f"https://www.hebcal.com/hebcal?cfg=json&v=1&maj=on&min=on&mf=on&mod=on&start={start}&end={end}")
        holiday_json = response.json()
        items = holiday_json["items"]

        dicta = {}

        for item in items:
            title = item['title']
            date = item['date']
            hdate = item['hdate']

            dicta[title] = {
                'date': date,
                'hdate': hdate
            }

        print(response)
        return render_template('index.html', dicta=dicta)


if __name__ == '__main__':
    application.run(host='localhost', port=8000, debug=True)
