# Create the style guide and homepage  
1. rails generate controller styles atoms molecules organisms  
2. rails generate controller --help  

# Create some partials  
1. <%= render(partial: 'idea_card') %>  
2. or if in the same folder:        
<%= render(partial: 'header') %>    
3. Partials are a small fragment of HTML in an ERB file, and can be referenced in views or layouts using <%= render(partial: 'partial_name') %>.  
4. Partials must always be created with a leading underscore in the filename, and must always be created within a subfolder of the app/views/ folder.  
5. Views can reference partials in different folders by including the folder name,  <%= render(partial: 'folder_name/partial_name') %>.  
6. Commonly used partials can be placed in the app/views/application/ folder, which means that the folder name can be omitted when referencing the partial within a view.  
  
# CSS, Sass and front end assets  
1. The first thing that we need to do is replace the default  app/assets/stylesheets/application.css file with a Sass equivalent,  app/assets/stylesheets/application.scss  
2. Beyond the application.scss file, the structure of Sass files within the  app/assets/stylesheets folder is entirely at a developer's discretion.  
3. include inside <head> tag  
<%= stylesheet_link_tag    'application', media: 'all' %>  
4. Images are put within the app/assets/images/  
5. reference images from css file  
 .some-class {  
  background-image: url(../images/mountain-lake.jpg);  
}  
6. or, using the asset pipeline    
.some-class {  
  background-image: asset-url('mountain-lake.jpg');  
}  
  
# Dynamic elements in views  
1. <a href="/styles/atoms"><%= 'Atoms' %></a>  
1. <%= link_to('Atoms', '/styles/atoms') %>  
2. <%= link_to('Text for anchor', '/relative/path') %>  
  
# Parameters for partials (use of locals)  
1. <%= render(partial: 'button', locals: { label: 'Accept' }) %>  
2. <%= render(partial: 'button', locals: { label: 'Go!',  
                                          extra_css_class: 'action' }) %>  
3. <%= button_tag(label, class: "button #{extra_css_class}") %>  
  
# Iterating in views  
1. loops    
<% [1, 2, 3, 4].each do %>  
  <p>One step through the array.</p>  
<% end %>  
  
# Form Helpers   
0. https://guides.rubyonrails.org/form_helpers.html#helpers-for-generating-form-elements
0. https://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-text_field_tag
1.  <%= form_tag(ideas_index_path, method: :get, class: 'form full') do %>  
  <%= text_field_tag('q', nil, class: 'input') %>  
  <%= button_tag('Search', class: 'button primary') %>  
<% end %>  
2. <%= text_field_tag('q', nil, class: 'input') %>      
  <input type="text" name="q" id="q" class="input" />  
3.   <%= button_tag('Search', class: 'button primary') %>  
 <button name="button" type="submit" class="button primary">  
    Search  
  </button>  
4.   <%= text_area_tag(:message, "Hi, nice site", size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_local_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>
<%= radio_button_tag(:age, "child") %>
<%= label_tag(:age_child, "I am younger than 21") %>
<%= check_box_tag(:pet_dog) %>
<%= label_tag(:pet_dog, "I own a dog") %>

# Models
1. rails generate MyNewModel attribute1:string attribute2:integer
2. rails db:migrate

