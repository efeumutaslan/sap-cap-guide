using { sap.capire.sapflix as my } from '../db/schema';
service CatalogService @(path:'/browse') { 

  @readonly entity Movies as select from my.Movies {*,
    director.name as director
  } excluding { createdBy, modifiedBy };

 // @requires: 'authenticated-user'
 // action submitOrder (movie: Movies:ID, id: ID);
}