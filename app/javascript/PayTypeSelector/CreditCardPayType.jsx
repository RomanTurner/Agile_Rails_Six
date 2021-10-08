import React, { Component } from 'react';

export default class CreditCardPayType extends Component {
  render() {
    return (
      <div>
        <div className='field'>
          <label htmlFor='order_credit_cardnumber'>CC #</label>
          <input
            type='password'
            name='order[credi_card_number]'
            id='order_credit_card_number'
          />
        </div>
        <div className='field'>
          <label htmlFor='order_expiration_date'>Expiry</label>
          <input
            type='text'
            name='order[expiration_date]'
            id='order_expiration_date'
            size='9'
            placeholder='e.g. 03/19'
          />
        </div>
      </div>
    );
  }
}
