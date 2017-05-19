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

<table>
  <thead>
    <div id="header">
    <tr>
      <th>Products expiring in 3 days</th>
      <th>Products expiring today</th>
      <th>Products out of stock</th>
      <th colspan="5"></th>
      <div>
    </tr>
  </thead>
  <tbody>
    <tr>

    </tr>
  </tbody>
<ul>Products that expire soon (in 3 days):
<% @products.expires_soon.each do |info| %>
  <li>
  <%= info.product_name %> : <%= info.quantity %> ||
  </li>
<% end %>
</ul>
<ul>Products that expire today:
<% @products.expires_today.each do |info| %>
  <li>
  <%= info.product_name %> : <%= info.quantity %> ||
  </li>
<% end %>
</ul>
<ul>Products that are not longer on stock :
<% @products.out_of_stock.each do |info| %>
  <li>
  <%= info.product_name %> : <%= info.quantity %> ||
  </li>
<% end %>

<ul>
<% @products.running_low.each do |info| %>
  <li>
  <%= info.product_name %> : <%= info.quantity %> ||
  </li>
<% end %>
</ul>
<td><%= link_to 'Look inside', storage_products_path(@storage) %></td>

<table>
  <thead>
    <div id="header">
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Type</th>
      <th>Expiration date</th>
      <th>Actions</th>
      <th colspan="5"></th>
      <div>
    </tr>
  </thead>
  <tbody>
    <% @products.each do |product| %>
      <tr>
        <td><%= product.product_name %></td>
        <td><%= product.quantity %></td>
        <td><%= product.product_type.product_type %></td>
        <td><%= product.expiration_date %></td>
        <td><%= link_to 'Edit',  edit_storage_product_path(@storage, product) %></td>
        <td><%= link_to 'Delete', storage_product_path(@storage, product), method: :delete, data: { confirm: 'Are you sure you want to delete?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>
<th colspan="2"></th>
