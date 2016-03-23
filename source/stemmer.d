private import std.string  : toStringz;
private import std.conv    : to;
      
struct Stemmer
{
   /// Return a list of valid algorithms you can use.
   static list()
   {
      string[] results;
      auto stemmers = sb_stemmer_list();
      
      size_t idx = 0;
      while(stemmers[idx] != null)
      {
         results ~= stemmers[idx].to!string;
         ++idx;
      }
      
      return results;
   }
   
   this(in string algorithm) { _stemmer = sb_stemmer_new(algorithm.toStringz, null); }
   ~this() { if (_stemmer) sb_stemmer_delete(_stemmer); }
   
   /// Stem a word using selected algorithm
   string stem(in string word) 
   { 
      return to!string(cast(char*)(sb_stemmer_stem(_stemmer, cast(sb_symbol*)word.toStringz, to!int(word.length))));
   }
   
   private sb_stemmer* _stemmer = null;
}

// We just need a couple of imports.
private
{
   extern (C):
   alias ubyte sb_symbol;
   struct sb_stemmer;
   const(char*)* sb_stemmer_list ();
   sb_stemmer* sb_stemmer_new (const(char)* algorithm, const(char)* charenc);
   void sb_stemmer_delete (sb_stemmer* stemmer);
   const(sb_symbol)* sb_stemmer_stem (sb_stemmer* stemmer, const(sb_symbol)* word, int size);
	int sb_stemmer_length (sb_stemmer* stemmer);
}
