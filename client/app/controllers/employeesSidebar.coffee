Spine               = require('spine')
Employee            = require('models/employee')
EmployeesListItem   = require('controllers/employeesListItem')
EmployeesFile       = require('controllers/employeesFile')
List                = require('lib/list')
$                   = Spine.$

class EmployeesSidebar extends Spine.Controller

  className: 'EmployeesSidebar sidebar span3'
  
  elements:
    ".items": "items"
    "input[type=search]": "search"
  
  events:
   'click #create': 'create'
   'keyup input[type=search]': 'filter'
  
  constructor: ->
    super
    
    @html require('views/listSidebar')(title: 'medewerkers')
    
    @list = new List
      el: @items, 
      template: require('views/employeesListItem'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Employee.find(params.id))

    Employee.bind('refresh change', @render)
    
    # not the cleanest solution as it goes outside of spine's event handlers. also it is called every time a reload occurs
    $('document').ready( -> $('.scroll-area').height($('#file').height() - 93)) # set the sidebar to the same height as the file by adjusting the height of the overflow area.

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    employees = Employee.filter(@query)
    @list.render(employees)

  change: (item) =>
    if item 
        @navigate '/admin/employees', item.id
    else
        @navigate '/admin/employees'

  create: ->
    if Employee.can["c"]
      item = Employee.create
        personal:
          initials: 'initialen'
          givenName: 'voornaam'
          familyName: 'achternaam'
          dateOfBirth: 'geboortedatum'
          sex: 'geslacht'
          idNumber: 'bsn'
          idDocument: 'legitimatie'
        photo: 'profielfoto'  
        tel:    
          work: 'tel_werk'
          private: 'tel_prive'
        mail:
          work: 'mail_werk'
          private: 'mail_prive' 
        ice:
          tel: 'ice_tel'
          name: 'ice_naam'
          relation: 'ice_relatie'
        address:
          street: 'straat'
          number: 'huisnummer'
          extension: 'huisnummer_toevoeging'
          postalcode: 'postcode'
          city: 'woonplaats'
          country: 'land'
        employed:
          role: 'rol'
          bankAccountNumber: 'bankrekening'
          inService: 'in_dienst'
          outService: 'uit_dienst'
          cv: 'cv'
          contract: 'contract'
      @navigate '/admin/employees', item.id
    else
      alert 'permission denied'
    
module.exports = EmployeesSidebar