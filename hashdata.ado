// Program to ger new data or check hash of old data
version 13

cap prog drop hashdata
prog def hashdata

  syntax ///
    [anything]   /// Location of the original DTA file
    using/     /// Location of the desired datafile placement
  , ///
    [replace]  /// replace DTA-file
    [reset]    /// EVEN IF HASH FAILS: resetting dtasig

// Setup
preserve // Respect current data

// Load target data
if `"`anything'"' != `""' use `anything' , clear

// Check existing hash, if any
cap datasignature confirm  using "`using'sig" , strict
  // If not found OR altered and no reset
  if ("`reset'" == "") {
    datasignature confirm using "`using'sig" , strict
  }
  // If altered OR missing AND reset ordered
  else {
    datasignature set , saving("`using'sig" , replace) reset
  }

// Place data
save "`using'" , `replace'

end

// Have a lovely day!
