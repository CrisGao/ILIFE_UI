/****************************************************************************
** Meta object code from reading C++ file 'colormaker.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "colormaker.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'colormaker.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ColorMaker_t {
    QByteArrayData data[17];
    char stringdata0[171];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ColorMaker_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ColorMaker_t qt_meta_stringdata_ColorMaker = {
    {
QT_MOC_LITERAL(0, 0, 10), // "ColorMaker"
QT_MOC_LITERAL(1, 11, 12), // "colorChanged"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 5), // "color"
QT_MOC_LITERAL(4, 31, 11), // "currentTime"
QT_MOC_LITERAL(5, 43, 7), // "strTime"
QT_MOC_LITERAL(6, 51, 5), // "start"
QT_MOC_LITERAL(7, 57, 4), // "stop"
QT_MOC_LITERAL(8, 62, 9), // "algorithm"
QT_MOC_LITERAL(9, 72, 17), // "GenerateAlgorithm"
QT_MOC_LITERAL(10, 90, 12), // "setAlgorithm"
QT_MOC_LITERAL(11, 103, 9), // "timeColor"
QT_MOC_LITERAL(12, 113, 9), // "RandomRGB"
QT_MOC_LITERAL(13, 123, 9), // "RandomRed"
QT_MOC_LITERAL(14, 133, 11), // "RandomGreen"
QT_MOC_LITERAL(15, 145, 10), // "RandomBlue"
QT_MOC_LITERAL(16, 156, 14) // "LinearIncrease"

    },
    "ColorMaker\0colorChanged\0\0color\0"
    "currentTime\0strTime\0start\0stop\0algorithm\0"
    "GenerateAlgorithm\0setAlgorithm\0timeColor\0"
    "RandomRGB\0RandomRed\0RandomGreen\0"
    "RandomBlue\0LinearIncrease"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ColorMaker[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       2,   56, // properties
       1,   64, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x06 /* Public */,
       4,    1,   47,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       6,    0,   50,    2, 0x0a /* Public */,
       7,    0,   51,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    0,   52,    2, 0x02 /* Public */,
      10,    1,   53,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QColor,    3,
    QMetaType::Void, QMetaType::QString,    5,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    0x80000000 | 9,
    QMetaType::Void, 0x80000000 | 9,    8,

 // properties: name, type, flags
       3, QMetaType::QColor, 0x00495103,
      11, QMetaType::QColor, 0x00095001,

 // properties: notify_signal_id
       0,
       0,

 // enums: name, flags, count, data
       9, 0x0,    5,   68,

 // enum data: key, value
      12, uint(ColorMaker::RandomRGB),
      13, uint(ColorMaker::RandomRed),
      14, uint(ColorMaker::RandomGreen),
      15, uint(ColorMaker::RandomBlue),
      16, uint(ColorMaker::LinearIncrease),

       0        // eod
};

void ColorMaker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ColorMaker *_t = static_cast<ColorMaker *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->colorChanged((*reinterpret_cast< const QColor(*)>(_a[1]))); break;
        case 1: _t->currentTime((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->start(); break;
        case 3: _t->stop(); break;
        case 4: { GenerateAlgorithm _r = _t->algorithm();
            if (_a[0]) *reinterpret_cast< GenerateAlgorithm*>(_a[0]) = _r; }  break;
        case 5: _t->setAlgorithm((*reinterpret_cast< GenerateAlgorithm(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (ColorMaker::*_t)(const QColor & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ColorMaker::colorChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (ColorMaker::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ColorMaker::currentTime)) {
                *result = 1;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ColorMaker *_t = static_cast<ColorMaker *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QColor*>(_v) = _t->color(); break;
        case 1: *reinterpret_cast< QColor*>(_v) = _t->timeColor(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ColorMaker *_t = static_cast<ColorMaker *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setColor(*reinterpret_cast< QColor*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject ColorMaker::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ColorMaker.data,
      qt_meta_data_ColorMaker,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ColorMaker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ColorMaker::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ColorMaker.stringdata0))
        return static_cast<void*>(const_cast< ColorMaker*>(this));
    return QObject::qt_metacast(_clname);
}

int ColorMaker::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
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
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ColorMaker::colorChanged(const QColor & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void ColorMaker::currentTime(const QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
