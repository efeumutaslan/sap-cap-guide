using { sap.capire.sapflix as my } from '../db/schema';
service AdminService { //In prod authenticated-user is must! @(requires:'authenticated-user') 
  entity Movies as projection on my.Movies;
  entity Series as projection on my.Series;
  entity Directors as projection on my.Directors;
}