// CCI conditions v1.0

#ifndef CCIConditions_IMP
#define CCIConditions_IMP
#include <ABaseCondition.mq4>
class CCIAboveValueCondition : public ABaseCondition
{
   int _period;
   double _value;
public:
   CCIAboveValueCondition(const string symbol, ENUM_TIMEFRAMES timeframe, int period, double value)
      :ABaseCondition(symbol, timeframe)
   {
      _period = period;
      _value = value;
   }

   bool IsPass(const int period)
   {
      double cciValue = iCCI(_symbol, _timeframe, _period, PRICE_CLOSE, period);
      return cciValue > _value;
   }
};

class CCIBelowValueCondition : public ABaseCondition
{
   int _period;
   double _value;
public:
   CCIBelowValueCondition(const string symbol, ENUM_TIMEFRAMES timeframe, int period, double value)
      :ABaseCondition(symbol, timeframe)
   {
      _period = period;
      _value = value;
   }

   bool IsPass(const int period)
   {
      double cciValue = iCCI(_symbol, _timeframe, _period, PRICE_CLOSE, period);
      return cciValue < _value;
   }
};
#endif