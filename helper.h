#ifndef HELPER_H
#define HELPER_H

#include <QObject>

class UserData {
public:
static int currentStep;
};

class helper : public QObject
{
    Q_OBJECT

public:
    explicit helper(QObject *parent = nullptr);

signals:

public slots:
    void newGame();
    void win();
    void setParent(QObject *obj, QObject *parent);
    int getCurrentStep();

    QObject* selectItem(QObject *obj);
    QObject* moveItem(QObject *obj);

private:
    QObject* selectedItem;
};

#endif // HELPER_H
