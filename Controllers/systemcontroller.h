#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

class SystemController : public QObject {
    Q_OBJECT
    Q_PROPERTY(DrinkTemperatureType drinkTemperature READ drinkTemperature WRITE setDrinkTemperature NOTIFY drinkTemperatureChanged)
    Q_PROPERTY(QString drinkType READ drinkType WRITE setDrinkType NOTIFY drinkTypeChanged)
    Q_PROPERTY(DrinkSize drinkSize READ drinkSize WRITE setDrinkSize NOTIFY drinkSizeChanged)
public:
    explicit SystemController(QObject* parent = nullptr);
    enum DrinkTemperatureType {
        NONE,
        HOT,
        COLD
    };
    Q_ENUM(DrinkTemperatureType);

    enum DrinkSize {
        NOSIZE,
        SMALL,
        MEDIUM,
        LARGE
    };
    Q_ENUM(DrinkSize);
    Q_INVOKABLE void startOrder(); // Q_Invokable exposes function to QML so it can be called

    DrinkTemperatureType drinkTemperature() const;

    QString drinkType() const;

    DrinkSize drinkSize() const;

public slots:

    void setDrinkTemperature(const DrinkTemperatureType& newDrinkTemperature);

    void setDrinkType(const QString& newDrinkType);

    void setDrinkSize(const DrinkSize& newDrinkSize);

signals:

    void drinkTemperatureChanged();

    void drinkTypeChanged();

    void drinkSizeChanged();

private:
    DrinkTemperatureType m_drinkTemperature;
    QString m_drinkType;
    DrinkSize m_drinkSize;
};

#endif // SYSTEMCONTROLLER_H
