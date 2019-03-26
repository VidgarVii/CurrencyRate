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
                                  { name: 'Евро', sign: '€', code: 'EUR' },
                                  { name: 'Швейцарский франк', sign: '₣', code: 'CHF' },
                                  { name: 'Японская иена', sign: '円', code: 'JPY' },
                                  { name: 'Австралийский доллар', sign: '$', code: 'AUD' },
                                  { name: 'Bitcoin Cash Доллар США', sign: '₿', code: 'BCH' },
                                  { name: 'Dash (криптовалюта)', sign: 'D', code: 'DSH' },
                                  { name: 'Золото', sign: 'Au', code: 'XAU' },
                                  { name: 'Ripple', sign: 'R', code: 'XRP' },
                                  { name: 'Litecoin', sign: 'Ł', code: 'LTC' },
                                  { name: 'Эфириум', sign: 'Э', code: 'ETH' },
                                  { name: 'Серебро', sign: 'Ag', code: 'XAG' },
                                  { name: 'Злотый', sign: 'zł', code: 'PLN' },
                                  { name: 'Песо', sign: '$', code: 'MXN' },
                                  { name: 'Крона', sign: 'kr.', code: 'DKK' },
                                  { name: 'Китайский Юань', sign: '¥', code: 'CNH' },
                                  { name: 'Доллар', sign: 'HK$', code: 'HKD' },
                                  { name: 'Рэнд', sign: 'R', code: 'ZAR' },
                                  { name: 'Лира', sign: '₺', code: 'TRY' },
                                  { name: 'Крона', sign: 'kr', code: 'SEK' },
                                  { name: 'Крона', sign: 'kr', code: 'NOK' },
                                  { name: 'Доллар', sign: '$', code: 'SGD' },
                                  { name: 'Доллар', sign: '$', code: 'NZD' },
                                  { name: 'Доллар', sign: '$', code: 'CAD' },
                                  { name: 'Фунт стерлингов Соединенного королевства', sign: '£', code: 'GBP' }
                              ])

pairs = CurrencyPair.create!([
                                { base: currencies[1], quote: currencies[0], price: 65.0 },
                                { base: currencies[1], quote: currencies[2], price: 75.0 },
                                { base: currencies[2], quote: currencies[1], price: 15.0 },
                                { base: currencies[2], quote: currencies[0], price: 75.0 }

                            ])
