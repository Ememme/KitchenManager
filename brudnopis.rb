<div class="field">
  <%= form.label :unit %><br>
  <%= form.select(:unit, options_for_select([['piece',1],['g',2],['kg',3],['ml',4],['l',5],['bottle',6]])) %>
</div>

<br>
<div class="field">
  <%= form.label :product_type %><br>
  <%= form.text_area :product_type, id: :product_type %>
</div>


<!-- <div class="field">
  <%= form.label :unit %><br>
  <%= form.select(product.products_type, options_for_select(@products_types), prompt: 'Choose one') %>

</div> -->
