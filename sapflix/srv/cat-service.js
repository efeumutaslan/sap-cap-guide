const cds = require('@sap/cds')
class CatalogService extends cds.ApplicationService { init() {
  const { Movies } = cds.entities('CatalogService')

  // Register your event handlers in here, for example:
  this.after ('each', Movies, movie => { 
    if (movie.ageRating > 18) { 
      movie.title += ` +18 only`
    } 
  }) 

  return super.init()
}}
module.exports = CatalogService