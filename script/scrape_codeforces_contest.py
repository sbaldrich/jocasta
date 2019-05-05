#!/usr/bin/python3

import sys
from pyquery import PyQuery as pq

if len(sys.argv) == 2:

    contest_url  = sys.argv[1]
    print("Scrapping contest from %s\n" % contest_url)
    dom = pq(url = contest_url)
    contest_name = dom('table.rtable > tbody > tr > th').text()
    n = dom('table.problems > tr').length

    with open('.contest_metadata', 'w') as out:

        out.write("Contest: %s\n"  % contest_name)
        out.write("URL: %s\n"      % contest_url)
        out.write("Problems: %d\n" % n)

        for problem in range(1, n):
            id   = dom('table.problems > tr').eq(problem).filter('tr > td').eq(0).text()
            name = dom('table.problems > tr').eq(problem).filter('tr > td').eq(1).filter('td > div > div > a').text()
            out.write("    %s - %s\n"% (id, name))
else:
    print("USAGE: %s <CONTEST_URL>" % sys.argv[0])
