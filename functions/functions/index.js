const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.sayHello = functions.https.onRequest((request, response) => {
  response.send("Amr sucks big time");
});

exports.firestore = functions.https.onRequest(async (data, response) => {
  await admin.firestore().runTransaction(async (t) => {
    const ref1 = admin.firestore().collection("users").doc("user1");
    const ref2 = admin.firestore().collection("users").doc("user2");
    const ref3 = admin.firestore().collection("users").doc("user3");
    const ref4 = admin.firestore().collection("users").doc("user4");
    const ref5 = admin.firestore().collection("users").doc("user5");
    const ref6 = admin.firestore().collection("users").doc("user6");
    const ref7 = admin.firestore().collection("users").doc("user7");
    const ref8 = admin.firestore().collection("users").doc("user8");
    const ref9 = admin.firestore().collection("users").doc("user9");
    const ref10 = admin.firestore().collection("users").doc("user10");

    const ref11 = admin.firestore().collection("users").doc("user11");
    const ref12 = admin.firestore().collection("users").doc("user12");
    const ref13 = admin.firestore().collection("users").doc("user13");
    const ref14 = admin.firestore().collection("users").doc("user14");
    const ref15 = admin.firestore().collection("users").doc("user15");
    const ref16 = admin.firestore().collection("users").doc("user16");
    const ref17 = admin.firestore().collection("users").doc("user17");
    const ref18 = admin.firestore().collection("users").doc("user18");
    const ref19 = admin.firestore().collection("users").doc("user19");
    const ref20 = admin.firestore().collection("users").doc("user20");

    const ref21 = admin.firestore().collection("users").doc("user21");
    const ref22 = admin.firestore().collection("users").doc("user22");
    const ref23 = admin.firestore().collection("users").doc("user23");
    const ref24 = admin.firestore().collection("users").doc("user24");
    const ref25 = admin.firestore().collection("users").doc("user25");

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

    const user11 = await t.get(ref11);
    const user12 = await t.get(ref12);
    const user13 = await t.get(ref13);
    const user14 = await t.get(ref14);
    const user15 = await t.get(ref15);
    const user16 = await t.get(ref16);
    const user17 = await t.get(ref17);
    const user18 = await t.get(ref18);
    const user19 = await t.get(ref19);
    const user20 = await t.get(ref20);

    const user21 = await t.get(ref21);
    const user22 = await t.get(ref22);
    const user23 = await t.get(ref23);
    const user24 = await t.get(ref24);
    const user25 = await t.get(ref25);

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

    t.update(ref11, { age: user11.data().age + 1 });
    t.update(ref12, { age: user12.data().age + 1 });
    t.update(ref13, { age: user13.data().age + 1 });
    t.update(ref14, { age: user14.data().age + 1 });
    t.update(ref15, { age: user15.data().age + 1 });
    t.update(ref16, { age: user16.data().age + 1 });
    t.update(ref17, { age: user17.data().age + 1 });
    t.update(ref18, { age: user18.data().age + 1 });
    t.update(ref19, { age: user19.data().age + 1 });
    t.update(ref20, { age: user20.data().age + 1 });

    t.update(ref21, { age: user21.data().age + 1 });
    t.update(ref22, { age: user22.data().age + 1 });
    t.update(ref23, { age: user23.data().age + 1 });
    t.update(ref24, { age: user24.data().age + 1 });
    t.update(ref25, { age: user25.data().age + 1 });
  });

  response.send("Done");
});
