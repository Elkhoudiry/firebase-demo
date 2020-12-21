const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.sayHello = functions.https.onRequest((request, response) => {
  response.send("Amr sucks big time");
});

exports.firestore = functions.https.onRequest(async (data, response) => {
  await admin.firestore().runTransaction(async (t) => {
    const ref1 = admin.firestore().collection("users").doc("userOne");
    const ref2 = admin.firestore().collection("users").doc("userTwo");
    const ref3 = admin.firestore().collection("users").doc("userThree");
    const ref4 = admin.firestore().collection("users").doc("userFour");
    const ref5 = admin.firestore().collection("users").doc("userFive");
    const ref6 = admin.firestore().collection("users").doc("userSix");
    const ref7 = admin.firestore().collection("users").doc("userSeven");
    const ref8 = admin.firestore().collection("users").doc("userEight");
    const ref9 = admin.firestore().collection("users").doc("userNine");
    const ref10 = admin.firestore().collection("users").doc("userTen");

    const user1 = await t.get(ref1);
    const user2 = await t.get(ref2);
    const user3 = await t.get(ref3);
    const user4 = await t.get(ref4);
    const user5 = await t.get(ref5);
    const user6 = await t.get(ref6);
    const user7 = await t.get(ref7);
    const user8 = await t.get(ref8);
    const user9 = await t.get(ref9);
    const user10 = await t.get(ref10);

    t.update(ref1, { age: user1.data().age + 1 });
    t.update(ref2, { age: user2.data().age + 1 });
    t.update(ref3, { age: user3.data().age + 1 });
    t.update(ref4, { age: user4.data().age + 1 });
    t.update(ref5, { age: user5.data().age + 1 });
    t.update(ref6, { age: user6.data().age + 1 });
    t.update(ref7, { age: user7.data().age + 1 });
    t.update(ref8, { age: user8.data().age + 1 });
    t.update(ref9, { age: user9.data().age + 1 });
    t.update(ref10, { age: user10.data().age + 1 });
  });

  response.send("Done");
});
