
["standard", "premium", "premium+"].each do |category_names|
  Category.find_or_create_by!(title: category_names)
end

User.create!(email: 'admin@app.com', password: '123123', admin: 'true')
User.create!(email: 'user@app.com', password: '123123', admin: 'false')

watches = [{
             name: 'Seiko', description: 'somewords123', category_id: '1',
             price: '100',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Seiko', description: 'somewords123', category_id: '1',
             price: '150',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Casio', description: 'somewords123', category_id: '1',
             price: '200',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Tissot', description: 'somewords123', category_id: '2',
             price: '300',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Swatch', description: 'somewords123', category_id: '2',
             price: '800',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Constant', description: 'somewords123', category_id: '2',
             price: '1000',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Nardin', description: 'somewords123', category_id: '3',
             price: '1500',view_url: 'http://localhost:3000/watches/photo/etc'},
           {
             name: 'Rolex', description: 'somewords123', category_id: '3',
             price: '2000',view_url: 'http://localhost:3000/watches/photo/etc'}
]
watches.each do |watch|
  Watch.create(watch)
end

