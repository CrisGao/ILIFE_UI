/**
 * @file /src/main.cpp
 *
 * @brief Qt based gui.
 *
 * @date November 2010
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QApplication>
#include "../include/robomap/main_window.hpp"
#include "../include/robomap/romap.h"
#include "../include/robomap/mapp.h"

#define COMPLEX_MODE
//#define DEFAULE

/*****************************************************************************
** Main
*****************************************************************************/
#ifdef COMPLEX_MODE
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
//#include <QWidget>
#include <QWindow>
#include <QQuickItem>
#include <QQuickView>
#include <QDebug>
#include "../include/robomap/rosclient.h"
//#include "../include/robomap/colormaker.h"
#endif


int main(int argc, char **argv) {

  /*********************
    ** Qt
    **********************/
  QApplication app(argc, argv);
#ifdef COMPLEX_MODE
  QQmlApplicationEngine engine;

  int fontId = QFontDatabase::addApplicationFont(":/images/Font/fontawesome-webfont.ttf");
  QStringList fontFamilies = QFontDatabase::applicationFontFamilies(fontId);

  engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

  if (engine.rootObjects().isEmpty())
    return -1;

  qmlRegisterType<RosClient>("an.qt.RosClient", 1, 0, "RosClient");

  QObject *QmlObj=engine.rootObjects().first();//获取QMl的源对象
  QWindow *QmlWindow=qobject_cast<QWindow *>(QmlObj);//获取qml在的源窗口
  QmlWindow->setTitle("ILIFE Test");//设置一个窗口标签，确认自己拿到的窗口句柄就是自己想要的
  WId parent_HWND = QmlWindow->winId();  //Qml窗口的句柄

  RoMap w;
  w.setGeometry(100,50,1090,625);//设置widget的大小
  w.winId();//必须调用，才能为widget创建句柄，否则将会失败
  w.windowHandle()->setParent(QmlWindow);//同样是设置父窗口
  w.show();

  RosClient rosc;


  // QObject *pWindow = QmlObj->findChild<QObject *>("mwindow");
  if(QmlObj)
  {
    QObject::connect(QmlObj,SIGNAL(indexChanged(QVariant)),&w,SLOT(showWindow(QVariant)));
    // std::cout<<"get the omlobj"<<std::endl;
  }



  //      QQuickView viewer;
  //      viewer.setSource(QUrl("qrc:/qml/MainForm.ui.qml"));
  //      QObject *item = viewer.rootObject();

  //      MyTest myclass;
  //      QObject::connect(item, SIGNAL(qmlSignal(QString)),
  //                       &myclass, SLOT(cppSlot(QString)));


  //      QQuickItem* rootItem = viewer.rootObject();

  //      QObject* quitButton = rootItem->findChild<QObject*>("mainButton");
  //      if(quitButton)
  //      {
  //          QObject::connect(quitButton,SIGNAL(clicked()),&w,SLOT(showWindow()));
  //      }
  //viewer.show();

  return app.exec();
#endif //COMPLEX_MODE
  /*******************************/
#ifdef DEFAULE
  //robomap::MainWindow w(argc,argv);
  RoMap w;
  w.show();
  app.connect(&app, SIGNAL(lastWindowClosed()), &app, SLOT(quit()));
  int result = app.exec();

  return result;
#endif.

}
