#ifndef ROSCLIENT_H
#define ROSCLIENT_H

#include <QObject>
#include <QDebug>

class RosClient : public QObject
{
  Q_OBJECT
  Q_ENUMS(ChooseHandle)

public:
  explicit RosClient(QObject *parent = 0);//nullptr
  void ros_init(int argc,char **argv);
  enum ChooseHandle{
    VoiceHandle,
    SuctionHandle,
    PressureHandle,
    BrushHandle,
    StartHandle,
    BatteryHandle
  };
   Q_INVOKABLE void setHandle(ChooseHandle handle);


signals:
   void voiceChanged(int value);

public slots:
  void sendMessageRun(int value=0);
  void startClient(bool);

private:
   int ros_voice;
   int ros_suction;
   ChooseHandle ros_handle;

};

#endif // MYTEST_H
