/* Task Description */
/*
* Create an object domElement, that has the following properties and methods:
  * use prototypal inheritance, without function constructors
  * method init() that gets the domElement type
    * i.e. `Object.create(domElement).init('div')`
  * property type that is the type of the domElement
    * a valid type is any non-empty string that contains only Latin letters and digits
  * property innerHTML of type string
    * gets the domElement, parsed as valid HTML
      * <type attr1="value1" attr2="value2" ...> .. content / children's.innerHTML .. </type>
  * property content of type string
    * sets the content of the element
    * works only if there are no children
  * property attributes
    * each attribute has name and value
    * a valid attribute has a non-empty string for a name that contains only Latin letters and digits or dashes (-)
  * property children
    * each child is a domElement or a string
  * property parent
    * parent is a domElement
  * method appendChild(domElement / string)
    * appends to the end of children list
  * method addAttribute(name, value)
    * throw Error if type is not valid
  * method removeAttribute(attribute)
    * throw Error if attribute does not exist in the domElement
*/


/* Example

var meta = Object.create(domElement)
	.init('meta')
	.addAttribute('charset', 'utf-8');

var head = Object.create(domElement)
	.init('head')
	.appendChild(meta)

var div = Object.create(domElement)
	.init('div')
	.addAttribute('style', 'font-size: 42px');

div.content = 'Hello, world!';

var body = Object.create(domElement)
	.init('body')
	.appendChild(div)
	.addAttribute('id', 'cuki')
	.addAttribute('bgcolor', '#012345');

var root = Object.create(domElement)
	.init('html')
	.appendChild(head)
	.appendChild(body);

console.log(root.innerHTML);
Outputs:
<html><head><meta charset="utf-8"></meta></head><body bgcolor="#012345" id="cuki"><div style="font-size: 42px">Hello, world!</div></body></html>
*/


function solve() {
	var domElement = (function () {
		var domElement = {
			init: function(type) {
        this.type = type;
        return this;
			},
			appendChild: function(child) {
        this.children = child;
        child.parent = this;

        return this;
			},
      addAttribute: function (name, value) {
        this.attributes = {name: name, value: value};
        
        return this;
			},
      removeAttribute: function (attribute) {
        if (!this.attributes[attribute]) {
          throw new Error('You are trying to remove attribute that does not exists');
        }
        delete this.attributes[attribute];
        return this;
      },
      get type() {
        return this._type;
      },
      set type(value) {
        var regex = /[A-Za-z0-9]+$/g;
        if (value === undefined || value.length === 0 || !(typeof value === 'string')) {
           throw new Error('Type must not be empty or undefined');
        }
        
        if (!regex.test(value)) {
          throw new Error('Type should only consists of Latin letters and numbers');
        }
        
        this._type = value;
        
      },
      get attributes() {
        return this._attributes;
      },
      set attributes(attr) {
         var regex = /^[A-Za-z0-9\-]+$/g;
        if (!regex.test(attr.name)) {
            throw new Error('Attribute name should only consists of Latin letters and numbers');
        }
        
        this._attributes = this._attributes || [];
        this._attributes[attr.name] = attr.value;
      },
      get content() {
        if (this.children === undefined) {
          return this._content;
        } else {
          return this.children;
        }
      },
      set content(value) {
        this._content = value;
      },
       get children() {
        return this._children;
      },
      set children(value) {
        if (domElement.isPrototypeOf(value) || typeof value === 'string') {
             this._children = value;
        } else {
          throw new Error('Children should be domElement or string');
        }
      },
      get parent() {
        return this._parent;
      },
      set parent(value) {
        if (!(domElement.isPrototypeOf(value))) {
            throw new Error('Parent should be domElement');
        }
        
        this._parent = value;
      },
      get innerHTML(){
      	var tempResult;
        var ot = '<', //opening tag
					ct = '>', //closing tag
					result = ot + this.type;

				//place attributes
				var keys = [];
				for (var key in this.attributes) {
					keys.push(key);
				}

				if (keys.length > 0) {
					keys.sort(function(a, b) {
						return b < a;
					});

					var len = keys.length,
						i;

					for (i = 0; i < len; i += 1) {
						result += ' ' + keys[i] + '="' + this.attributes[keys[i]] + '"';
					}
				}

				//closing the opening tag
				result += ct;

				for (var child in this.children) {
					if (typeof(this.children[child]) === 'string') {
						tempResult = this.children[child].innerHTML;
						if (tempResult !== 'undefined') {
							result += tempResult;
						}
					} else {
						if (child.innnerHTML !== 'undefined') {
							result += child.innerHTML;
						}
						
					}
				}

				result += ot + '/' + this.type + ct;

			
				return result;
      }
		};
		return domElement;
	} ());
	return domElement;
}
module.exports = solve;
