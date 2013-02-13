# -*- coding: utf-8 -*-

from bottle import route, run, view, static_file
import bottle
import xlrd

PATH = 'path_here'
SERVER = '127.0.0.1'
PORT = 8888


def get_data():
    bo = xlrd.open_workbook(PATH)
    sh = bo.sheet_by_index(0)
    return [map(lambda x: x.value, sh.row(i)) for i in range(3, sh.nrows)]


@route('/')
@view('index')
def hello():
    return dict(data=get_data())


@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='.')

bottle.debug(True)
run(host=SERVER, port=PORT, reloader=True)
