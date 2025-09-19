//As clean code practices we shouldnt comment the obvious, but here we do it for learning purposes
//cuid defines the key ID. It can define also with  "key ID : UUID;"
using { Currency, cuid, managed } from '@sap/cds/common';    
namespace sap.capire.sapflix;

// Entity definition for Movies
entity Movies : Content, cuid, managed {  // Short Syntax for aspect reuse
    runtime : Integer; // Runtime in minutes
}

// Entity definition for Series
entity Series {  // Aspect defined separately for long syntax reuse

    seasons : Integer; // Number of seasons
    episodes : Integer; // Total number of episodes
}

extend Series with Content, cuid, managed; // Long Syntax for aspect reuse

// Entity definition for Extra Content (like behind-the-scenes, interviews, etc.)
entity ExtraContent {
  key ID : UUID;
  title  : localized String(111);
  type   : localized String(50);
  relatedMovie : Association to Movies;
  relatedSeries : Association to Series;
  price  : Decimal(9,2);
  currency : Currency;
}

// Association to Directors entity
entity Directors {
    key ID : UUID;
    name   : String(111);
    movies : Composition of many Movies on movies.director = $self; // If a director is deleted, their movies are also deleted
}

aspect Content{
    title  : String(111);
    genre  : Genre;
    rating : Integer;
    director : Association to Directors;
    price  : Decimal(9,2);
    currency : Currency;
    ageRating : Integer; // e.g., PG-13, R, etc.
    release_date : Date;
    }

// Enum definition for movie genres (It can be done with Code Lists in a real-world scenario)
type Genre : Integer enum {
    Action   = 1;
    Comedy   = 2;
    Drama    = 3;
    Fantasy  = 4;
    Horror   = 5;   
    Romance  = 6;
    SciFi    = 7;
    Thriller = 8;
}