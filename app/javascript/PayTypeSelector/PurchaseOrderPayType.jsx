import React, { Component } from 'react';

export default class PurchaseOrderPayType extends Component {
  render() {
    return (
      <div>
        <div className='field'>
          <label htmlFor='order_po_number'>PO #</label>
          <input type='password' name='order[po_number]' id='order_po_number' />
        </div>
      </div>
    );
  }
}
