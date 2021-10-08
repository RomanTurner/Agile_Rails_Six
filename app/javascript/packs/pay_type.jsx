import React from 'react';
import ReactDOM from 'react-dom';
import PayTypeSelector from 'PayTypeSelector';

document.addEventListener('turbolinks:load', function () {
  var element = document.getElementById('pay-type-component'); // (5)
  ReactDOM.render(<PayTypeSelector />, element);
});
