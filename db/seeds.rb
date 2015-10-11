# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
Category.create([
        {
            id:1,
            name: '公司注册',
            slug: 'Registration',
            slug_lower: 'registration',
            parent_id: 0,
            typeof:1
        },
        {
            id:2,
            name: '财会税务',
            slug: 'Accounting',
            slug_lower: 'accounting',
            parent_id: 0,
            typeof:1

        },
        {
            id:3,
            name: '创业法律',
            slug: 'Start',
            slug_lower: 'start',
            parent_id: 0,
            typeof:1

        },
        {
            id:4,
            name: '人事社保',
            slug: 'Security',
            slug_lower: 'security',
            parent_id: 0,
            typeof:1

        },
        {
            id:5,
            name: '注册指南',
            slug: 'RegistrationGuide',
            slug_lower: 'registrationguide',
            parent_id: 1,
            typeof:1


        },
        {
            id:6,
            name: '企业类型',
            slug: 'RegistrationType',
            slug_lower: 'registrationtypeof',
            parent_id: 1,
            typeof:1

        },
        {
            id:7,
            name: '税务报道',
            slug: 'AccountingReport',
            slug_lower: 'Accountingreport',
            parent_id: 2,
            typeof:1

        },
        {
            id:8,
            name: '记账报税',
            slug: 'AccountingTax',
            slug_lower: 'Accountingtax',
            parent_id: 2,
            typeof:1
        },
        {
            id:9,
            name: '发票',
            slug: 'AccountingBill',
            slug_lower: 'Accountingbill',
            parent_id: 2,
            typeof:1

        },
        {
            id:10,
            name: '发票',
            slug: 'AccountingBill',
            slug_lower: 'Accountingbill',
            parent_id: 3,
            typeof:1
        },
        {
            id:11,
            name: '我要开公司',
            parent_id: 0,
            typeof:2
        },

    ])


Product.delete_all
Product.create! id: 1, name: "快公司", price: 0.49, active: true
Product.create! id: 2, name: "快合伙", price: 0.29, active: true
Product.create! id: 3, name: "工商变更", price: 1.99, active: true


OrderStatus.delete_all
OrderStatus.create! id: 1, name: "支付完成，等待中"
OrderStatus.create! id: 2, name: "进行中"
OrderStatus.create! id: 3, name: "完成"
OrderStatus.create! id: 4, name: "取消"

