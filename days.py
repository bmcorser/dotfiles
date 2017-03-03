import sys
import datetime
import time
from dateutil import rrule

date = datetime.datetime(2016, 4, 25)
now = datetime.datetime.now()

def get_working_days(date_start_obj, date_end_obj):
    weekdays = rrule.rrule(rrule.DAILY, byweekday=range(0, 5), dtstart=date_start_obj, until=date_end_obj)
    weekdays = len(list(weekdays))
    if int(time.strftime('%H')) >= 18:
        weekdays -= 1
    return weekdays


days = get_working_days(now, date)
print("{2} real units {0} psudeo units and {1} qunits".format(days, days/5, (date - now).days))
