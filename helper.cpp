#include "helper.h"
#include <QDebug>
#include <QMessageBox>
#include <QApplication>

int UserData::currentStep = 0;

helper::helper(QObject *parent) : QObject(parent)
{

}

void helper::win()
{
    QMessageBox msgBox;
    msgBox.setText("  You won!!!  ");
    msgBox.setWindowTitle("  Win  ");
    msgBox.exec();
}

void helper::setParent(QObject *obj, QObject *parent)
{
    obj->setParent(parent);
}

void helper::newGame()
{   
    UserData::currentStep = 0;
    selectedItem = nullptr;
}

QObject* helper::selectItem(QObject *obj)
{
    if(selectedItem != nullptr)
    {
        return nullptr;
    }

    int maxVal = 0;
    QObject *top = nullptr;

    for(int i = 0; i < obj->children().length(); i++)
        {
            int currentVal = obj->children()[i]->objectName().toInt();
            if(currentVal > maxVal)
            {
                maxVal = currentVal;
                top = obj->children()[i];
            }
        }

    if(top != nullptr)
    {
        selectedItem = top;
        return selectedItem;
    }

    return nullptr;
}

QObject* helper::moveItem(QObject *obj)
{
    int maxVal = 0;
    if(selectedItem != nullptr)
    {
        QObject *tmp = selectedItem;
        for(int i=0; i<obj->children().length(); i++)
        {
            int currentVal = obj->children()[i]->objectName().toInt();
            if(currentVal >= maxVal)
            {
                maxVal = currentVal;
            }
        }

        if (tmp->objectName().toInt() >= maxVal)
        {
            selectedItem = nullptr;
            tmp->setParent(obj);
            UserData::currentStep++;
            return tmp;
        }

        return nullptr;
    }

    return nullptr;
}

int helper::getCurrentStep()
{
    return UserData::currentStep;
}

