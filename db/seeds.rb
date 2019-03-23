# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

currencies = Currency.create!([
                                  { name: 'Рубль', sign: '₽', code: 'RUB' },
                                  { name: 'Доллар', sign: '$', code: 'USD' },
                                  { name: 'Евро', sign: '€', code: 'EUR' }
                              ])

pairs = CurrencyPair.create!([
                                { base: currencies[1], quote: currencies[0], price: 65.0 },
                                { base: currencies[1], quote: currencies[2], price: 75.0 },
                                { base: currencies[2], quote: currencies[1], price: 15.0 },
                                { base: currencies[2], quote: currencies[0], price: 75.0 }

                            ])

User.create!(email: 'admin@mail.ru', password: '123456', encrypted_password: '123456', admin: true)