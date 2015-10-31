/* Task Description */
/* 
	Create a function constructor for Person. Each Person must have:
	*	properties `firstname`, `lastname` and `age`
		*	firstname and lastname must always be strings between 3 and 20 characters, containing only Latin letters
		*	age must always be a number in the range 0 150
			*	the setter of age can receive a convertible-to-number value
		*	if any of the above is not met, throw Error 		
	*	property `fullname`
		*	the getter returns a string in the format 'FIRST_NAME LAST_NAME'
		*	the setter receives a string is the format 'FIRST_NAME LAST_NAME'
			*	it must parse it and set `firstname` and `lastname`
	*	method `introduce()` that returns a string in the format 'Hello! My name is FULL_NAME and I am AGE-years-old'
	*	all methods and properties must be attached to the prototype of the Person
	*	all methods and property setters must return this, if they are not supposed to return other value
		*	enables method-chaining
*/
function solve() {
	var Person = (function () {
		function Person(firstname, lastname, age) {
			this.firstname = firstname;
			this.lastname = lastname;
			this.age = age;
		}

		Object.defineProperty(Person.prototype, 'firstname', {
			get: function () {
				return this._firstname;
			},
			set: function (value) {
				var regex = /^[a-zA-Z]*$/;
				if (value.length < 3 || value.length > 20) {
					throw new Error('First name length should be between 3 and 20 characters');
				}
				if (!regex.test(value)) {
					throw new Error('First name should be only latin letters');
				}

				this._firstname = value;
			},
			enumerable: true,
			configurable: true
		});

		Object.defineProperty(Person.prototype, 'lastname', {
			get: function () {
				return this._lastname;
			},
			set: function (value) {
				var regex = /^[a-zA-Z]*$/;
				if (value.length < 3 || value.length > 20) {
					throw new Error('Last name length should be between 3 and 20 characters');
				}
				if (!regex.test(value)) {
					throw new Error('Last name should be only latin letters');
				}

				this._lastname = value;
			},
			enumerable: true,
			configurable: true
		});

		Object.defineProperty(Person.prototype, 'age', {
			get: function () {
				return this._age;
			},
			set: function (value) {
				value = +value;
				if (isNaN(value)) {
					throw new Error('Age should be number');
				}
				if (value < 0 || value > 150) {
					throw new Error('Age should be between 0 and 150');
				}

				this._age = value;
			}
		});

		Object.defineProperty(Person.prototype, 'fullname', {
			get: function () {
				return this.firstname + ' ' + this.lastname;
			},
			set: function (value) {
				var arr = value.split(' ');
				this.firstname = arr[0];
				this.lastname = arr[1];
			},
			enumerable: true,
			configurable: true
		});

		Person.prototype.introduce = function () {
			return 'Hello! My name is ' + this.fullname + ' and I am ' + this.age + '-years-old'
		}

		return Person;
	} ());
	return Person;
}
module.exports = solve;