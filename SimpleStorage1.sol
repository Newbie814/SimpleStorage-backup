// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; // (>=0.8.7 <0.9.0)This tells compiler we are ok with any version between these (non inclusive for 0.9.0)^ before first number (^0.8.7) tells program we are ok with this and any newer version of solidity

// basic data types: boolean, {uint, int can specify how many bytes, defaults to 256} address, bytes -- variables have to be declared
contract SimpleStorage {
     
      uint256 favoriteNumber; // when value is not expicitly declared, defaults to null value, which in solidity is 0
// public is a 'getter' function
    //   People public person = People({favoriteNumber: 18, name: "Matthew"});
    //   People public person2 = People({favoriteNumber: 3, name: "Sandra"});
    //   People public person3 = People({favoriteNumber: 2, name: "Connor"});
    //   People public person4 = People({favoriteNumber: 1, name: "Liam"});

    //better to store the above in an array
      People[] public people;


      struct People {
          uint256 favoriteNumber;
          string name;
      }  // basically setting the template and data types for the object
      



      function store(uint256 _favoriteNumber) public {
          favoriteNumber = _favoriteNumber; // underscore is just to differentiate this var from original. Just a naming convention in solidity
               }

      function retrieve() public view returns(uint256) {
                   return favoriteNumber;
               }
      function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //   people.push(People(_favoriteNumber, _name)); alternative method to add to people array
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name}); //alternatively, can use just the variable names as arguments in the order they appear in the struct. Method shown is, generally, favorable, as it is more expicit 
        people.push(newPerson);
      }

      
}

// view and pure fucntions can't change state, thus do not use gas -- unless called by a gas using function

//0xd9145CCE52D386f254917e481eB44e9943F39138