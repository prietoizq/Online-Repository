

c1 = Contact.create name: "Angel", address: "Calle 1, puerta 1"
c2 = Contact.create name: "Alberto", address: "Calle 2, puerta 1"
c3 = Contact.create name: "Javi", address: "Calle 3, puerta 3"
c4 = Contact.create name: "Alex", address: "Calle 4, puerta 9"
c5 = Contact.create name: "Virginia", address: "Calle 5, puerta 8"
c6 = Contact.create name: "Jose Luis", address: "Calle 5, puerta 3"


c1.phones.create number: "679745324"
c2.phones.create number: "634590474"
c3.phones.create number: "671135487"
c4.phones.create number: "623567324"
c5.phones.create number: "656778774"
c6.phones.create number: "671156237"
c1.phones.create number: "675675324"
c2.phones.create number: "672350474"
c3.phones.create number: "671156757"
c4.phones.create number: "625673324"
c5.phones.create number: "672567774"
c6.phones.create number: "671567237"


c1.emails.create address: "prietoizq@gmail.com"
c2.emails.create address: "correodeprueba@gmail.com"
c3.emails.create address: "correodeprueba3@gmail.com"
c4.emails.create address: "correodeprueba4@gmail.com"
c5.emails.create address: "correodeprueba5@gmail.com"
c6.emails.create address: "correodeprueba6@gmail.com"


puts "Correctamente ejecutado"

