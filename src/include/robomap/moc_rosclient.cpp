/****************************************************************************
** Meta object code from reading C++ file 'rosclient.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "rosclient.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'rosclient.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_RosClient_t {
    QByteArrayData data[15];
    char stringdata0[166];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_RosClient_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_RosClient_t qt_meta_stringdata_RosClient = {
    {
QT_MOC_LITERAL(0, 0, 9), // "RosClient"
QT_MOC_LITERAL(1, 10, 12), // "voiceChanged"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 5), // "value"
QT_MOC_LITERAL(4, 30, 14), // "sendMessageRun"
QT_MOC_LITERAL(5, 45, 11), // "startClient"
QT_MOC_LITERAL(6, 57, 9), // "setHandle"
QT_MOC_LITERAL(7, 67, 12), // "ChooseHandle"
QT_MOC_LITERAL(8, 80, 6), // "handle"
QT_MOC_LITERAL(9, 87, 11), // "VoiceHandle"
QT_MOC_LITERAL(10, 99, 13), // "SuctionHandle"
QT_MOC_LITERAL(11, 113, 14), // "PressureHandle"
QT_MOC_LITERAL(12, 128, 11), // "BrushHandle"
QT_MOC_LITERAL(13, 140, 11), // "StartHandle"
QT_MOC_LITERAL(14, 152, 13) // "BatteryHandle"

    },
    "RosClient\0voiceChanged\0\0value\0"
    "sendMessageRun\0startClient\0setHandle\0"
    "ChooseHandle\0handle\0VoiceHandle\0"
    "SuctionHandle\0PressureHandle\0BrushHandle\0"
    "StartHandle\0BatteryHandle"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_RosClient[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       1,   52, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   42,    2, 0x0a /* Public */,
       4,    0,   45,    2, 0x2a /* Public | MethodCloned */,
       5,    1,   46,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       6,    1,   49,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int,    3,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    2,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 7,    8,

 // enums: name, flags, count, data
       7, 0x0,    6,   56,

 // enum data: key, value
       9, uint(RosClient::VoiceHandle),
      10, uint(RosClient::SuctionHandle),
      11, uint(RosClient::PressureHandle),
      12, uint(RosClient::BrushHandle),
      13, uint(RosClient::StartHandle),
      14, uint(RosClient::BatteryHandle),

       0        // eod
};

void RosClient::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        RosClient *_t = static_cast<RosClient *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->voiceChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->sendMessageRun((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->sendMessageRun(); break;
        case 3: _t->startClient((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->setHandle((*reinterpret_cast< ChooseHandle(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (RosClient::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&RosClient::voiceChanged)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject RosClient::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_RosClient.data,
      qt_meta_data_RosClient,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *RosClient::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *RosClient::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_RosClient.stringdata0))
        return static_cast<void*>(const_cast< RosClient*>(this));
    return QObject::qt_metacast(_clname);
}

int RosClient::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void RosClient::voiceChanged(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
