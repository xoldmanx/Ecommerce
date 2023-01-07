import datetime

def get_date():
    date_courant = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    return date_courant


