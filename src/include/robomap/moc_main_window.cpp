/****************************************************************************
** Meta object code from reading C++ file 'main_window.hpp'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "main_window.hpp"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'main_window.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_robomap__MainWindow_t {
    QByteArrayData data[10];
    char stringdata0[188];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_robomap__MainWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_robomap__MainWindow_t qt_meta_stringdata_robomap__MainWindow = {
    {
QT_MOC_LITERAL(0, 0, 19), // "robomap::MainWindow"
QT_MOC_LITERAL(1, 20, 24), // "on_actionAbout_triggered"
QT_MOC_LITERAL(2, 45, 0), // ""
QT_MOC_LITERAL(3, 46, 25), // "on_button_connect_clicked"
QT_MOC_LITERAL(4, 72, 5), // "check"
QT_MOC_LITERAL(5, 78, 40), // "on_checkbox_use_environment_s..."
QT_MOC_LITERAL(6, 119, 5), // "state"
QT_MOC_LITERAL(7, 125, 17), // "updateLoggingView"
QT_MOC_LITERAL(8, 143, 21), // "on_pushButton_clicked"
QT_MOC_LITERAL(9, 165, 22) // "on_btn_mapping_clicked"

    },
    "robomap::MainWindow\0on_actionAbout_triggered\0"
    "\0on_button_connect_clicked\0check\0"
    "on_checkbox_use_environment_stateChanged\0"
    "state\0updateLoggingView\0on_pushButton_clicked\0"
    "on_btn_mapping_clicked"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_robomap__MainWindow[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x0a /* Public */,
       3,    1,   45,    2, 0x0a /* Public */,
       5,    1,   48,    2, 0x0a /* Public */,
       7,    0,   51,    2, 0x0a /* Public */,
       8,    0,   52,    2, 0x08 /* Private */,
       9,    0,   53,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    4,
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void robomap::MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->on_actionAbout_triggered(); break;
        case 1: _t->on_button_connect_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->on_checkbox_use_environment_stateChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->updateLoggingView(); break;
        case 4: _t->on_pushButton_clicked(); break;
        case 5: _t->on_btn_mapping_clicked(); break;
        default: ;
        }
    }
}

const QMetaObject robomap::MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_robomap__MainWindow.data,
      qt_meta_data_robomap__MainWindow,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *robomap::MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *robomap::MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_robomap__MainWindow.stringdata0))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int robomap::MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
