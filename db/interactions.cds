namespace app.interactions;
 
using
{
    Country,
    Currency,
    cuid,
    managed
}
from '@sap/cds/common';
 
entity Headers : cuid, managed
{
    items : Composition of many Items on items.interaction = $self;
    partner : BusinessKey;
    country : Country;
};
 
entity Items : cuid, managed
{
    interaction : Association to one Headers;
    text : localized Text;
    date : DateTime;
    price : Price
        @semantics.amount.currencyCoode : 'currency';
    currency : Currency;
};
 
type BusinessKey : String(10);
 
type Price : Decimal(10,2);
 
type Text : String(1024);
 