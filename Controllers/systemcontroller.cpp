#include "systemcontroller.h"
#include <QDebug>

SystemController::SystemController(QObject* parent)
    : QObject { parent }
    , m_drinkTemperature(NONE)
    , m_drinkType("NONE")
    , m_drinkSize(NOSIZE)
{
}

void SystemController::startOrder()
{
    qDebug() << "Drink temp: " << (m_drinkTemperature == HOT ? "Hot" : "Cold");
    qDebug() << "Drink type: " << m_drinkType;

    QString debugDrinkSize;
    switch (m_drinkSize) {
    case SMALL:
        debugDrinkSize = "Small";
        break;
    case MEDIUM:
        debugDrinkSize = "Medium";
        break;
    case LARGE:
        debugDrinkSize = "Large";
        break;
    case NOSIZE:
        debugDrinkSize = "NO SIZE";
        break;
    }
    qDebug() << "Drink size: " << debugDrinkSize;
}

SystemController::DrinkTemperatureType SystemController::drinkTemperature() const
{
    return m_drinkTemperature;
}

void SystemController::setDrinkTemperature(const DrinkTemperatureType& newDrinkTemperature)
{
    if (m_drinkTemperature == newDrinkTemperature)
        return;
    m_drinkTemperature = newDrinkTemperature;
    emit drinkTemperatureChanged();
}

QString SystemController::drinkType() const
{
    return m_drinkType;
}

void SystemController::setDrinkType(const QString& newDrinkType)
{
    if (m_drinkType == newDrinkType)
        return;
    m_drinkType = newDrinkType;
    emit drinkTypeChanged();
}

SystemController::DrinkSize SystemController::drinkSize() const
{
    return m_drinkSize;
}

void SystemController::setDrinkSize(const DrinkSize& newDrinkSize)
{
    if (m_drinkSize == newDrinkSize)
        return;
    m_drinkSize = newDrinkSize;
    emit drinkSizeChanged();
}
