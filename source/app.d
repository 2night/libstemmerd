import std.stdio;
import stemmer;

void main()
{  
   // Print a list of available languages
   writeln("Available languages: ");
   foreach(stemmer; Stemmer.list)
      writeln(" - ", stemmer);
   
   // Create an english stemmer
   Stemmer s = Stemmer("english");

   // Try it!
   assert(s.stem("testing")   == "test");
   assert(s.stem("test")      == "test");
   assert(s.stem("tested")    == "test");
   
   assert(s.stem("consist")         == "consist");
   assert(s.stem("consisted")       == "consist");
   assert(s.stem("consistency")     == "consist");
   assert(s.stem("consistent")      == "consist");
   assert(s.stem("consistently")    == "consist");
   assert(s.stem("consisting")      == "consist");
   assert(s.stem("consists")        == "consist");

}
