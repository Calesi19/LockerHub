import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
// import axios from "axios";
// import {Timestamp} from "firebase-admin/firestore";

admin.initializeApp();
const db = admin.firestore();

export const getUser = functions.https.onRequest(async (req, res) => {
  const userId = String(req.query.id);
  if (!userId) {
    res.status(400).send({message: "Missing user id"});
    return;
  }
  try {
    const doc = await db.collection("users").doc(userId).get();
    if (!doc.exists) {
      res.status(404).send({message: `User with ID: ${userId} does not exist`});
    } else {
      res.send(doc.data());
    }
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});


export const getUnitsByZipcode = functions.https.onRequest(async (req, res) => {
  const zipCode = parseInt(String(req.query.zipcode));

  if (!zipCode) {
    res.status(400).send({message: "Missing ZipCode"});
    return;
  }

  try {
    const querySnapshot = await db.collection("units")
      .where("zipcode", "==", zipCode)
      .where("isAvailable", "==", true)
      .get();

    // If no documents are found, send a 404 message
    if (querySnapshot.empty) {
      res.status(404)
        .send(
          {message: `No units found for the provided zipcode: ${zipCode}`}
        );
      return;
    }

    // Create an array to collect all the documents
    const units: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array.
    querySnapshot.forEach((doc) => {
      units.push({id: doc.id, data: doc.data()});
    });
    res.send(units);
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});

export const getUnitsByOwner = functions.https.onRequest(async (req, res) => {
  const ownerId = String(req.query.owner);

  if (!ownerId) {
    res.status(400).send({message: "Missing Owner ID"});
    return;
  }

  try {
    const querySnapshot = await db.collection("units")
      .where("owner", "==", ownerId)
      .get();

    // If no documents are found, send a 404 message
    if (querySnapshot.empty) {
      res.status(404)
        .send(
          {message: `No units found for the provided owner ID: ${ownerId}`}
        );
      return;
    }

    // Create an array to collect all the documents
    const units: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array
    querySnapshot.forEach((doc) => {
      units.push({id: doc.id, data: doc.data()});
    });
    res.send(units);
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});


export const getUnitsByState = functions.https.onRequest(async (req, res) => {
  const state = String(req.query.state);

  if (!state) {
    res.status(400).send({message: "Missing state"});
    return;
  }

  try {
    const querySnapshot = await db.collection("units")
      .where("state", "==", state)
      .where("isAvailable", "==", true)
      .get();

    // If no documents are found, send a 404 message
    if (querySnapshot.empty) {
      res.status(404)
        .send(
          {message: `No units found for the provided state: ${state}`}
        );
      return;
    }

    // Create an array to collect all the documents
    const units: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array
    querySnapshot.forEach((doc) => {
      units.push({id: doc.id, data: doc.data()});
    });
    res.send(units);
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});

export const getUnitsByCity = functions.https.onRequest(async (req, res) => {
  const city = String(req.query.city);

  if (!city) {
    res.status(400).send({message: "Missing city"});
    return;
  }

  try {
    const querySnapshot = await db.collection("units")
      .where("city", "==", city)
      .where("isAvailable", "==", true)
      .get();

    // If no documents are found, send a 404 message
    if (querySnapshot.empty) {
      res.status(404)
        .send(
          {message: `No units found for the provided state: ${city}`}
        );
      return;
    }

    // Create an array to collect all the documents
    const units: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array
    querySnapshot.forEach((doc) => {
      units.push({id: doc.id, data: doc.data()});
    });
    res.send(units);
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});


export const getActivityLogByUnit = functions.https
  .onRequest(async (req, res) => {
    const unitId = String(req.query.unitId);
    const ownerId = String(req.query.ownerId);

    if (!unitId) { // Check if unitId is provided
      res.status(400).send({message: "Missing unit ID"});
      return;
    }

    try {
      // Get all the documents that match the unitId and ownerId

      const querySnapshot = await db.collection("activityLog")
        .where("unitId", "==", unitId)
        .where("ownerId", "==", ownerId)
        .get();

      // If no documents are found, send a 404 message
      if (querySnapshot.empty) {
        res.status(404)
          .send(
            {
              message:
                `No activity log found for the provided unit ID: ${unitId}`,
            }
          );
        return;
      }

      // Create an array to collect all the documents
      const activityLog: admin.firestore.DocumentData[] = [];

      // Loop through the documents and push their data into the array
      querySnapshot.forEach((doc) => {
        activityLog.push({id: doc.id, data: doc.data()});
      });
      res.send(activityLog);
    } catch (error) {
      res.status(500).send({message: `Something went wrong: ${error}`});
    }
  });


export const getPaymentsByUnit = functions.https.onRequest(async (req, res) => {
  const unitId = String(req.query.unitId);

  if (!unitId) { // Check if unitId is provided
    res.status(400).send({message: "Missing unit ID"});
    return;
  }

  try {
    const querySnapshot = await db.collection("payments")
      .where("unitId", "==", unitId)
      .get();

    // If no documents are found, send a 404 message
    if (querySnapshot.empty) {
      res.status(404)
        .send(
          {message: `No payments found for the provided unit ID: ${unitId}`}
        );
      return;
    }

    // Create an array to collect all the documents
    const payments: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array
    querySnapshot.forEach((doc) => {
      payments.push({id: doc.id, data: doc.data()});
    });
    res.send(payments);
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});

// function to open locker

export const openLocker = functions.https.onRequest(async (req, res) => {
  const unitId = String(req.query.unitId);
  // const ownerId = String(req.query.ownerId);

  if (!unitId) { // Check if unitId is provided
    res.status(400).send({message: "Missing unit ID"});
    return;
  }


  try {
    // Query for the unit document with the provided unitId.
    const querySnapshot = await db.collection("units").doc(unitId).get();


    // Console log what locker has been opened.
    // Include the locker's number, city, time, and date.
    // Get the information from the unit document.

    const unit = querySnapshot.data();

    if (!unit) {
      res.status(404).send({message: `Unit not found: ${unitId}`});
      return;
    }


    const unitNumber = unit.number;
    const city = unit.city;
    const time = Date.now();


    console.log(`Locker ${unitNumber} in ${city} was opened at ${time}`);

    res.send({
      message: `Locker ${unitNumber} in ${city} was opened at ${time}`,
    });

    /* Code that would be used to open the locker
    // Create an array to collect all the documents
    const units: admin.firestore.DocumentData[] = [];

    // Loop through the documents and push their data into the array
    querySnapshot.forEach((doc) => {

      // Query for server url. The server url is stored in the unit document.
      const serverUrl = doc.data().serverId;

      // Query for locker id. The locker id is stored in the unit document.
      const lockerId = doc.data().lockerId;

      // Query for locker access code id.
      // The locker access code id is stored in the unit document.
      const lockerAccessCodeId = doc.data().accessCodeId;

      // Query for access code from the "codes" collection.
      // The access code is stored in the codes document.
      const accessCodeRef = db.collection("codes").doc(lockerAccessCodeId);

      // Get the access code from the codes document
      const accessCode = accessCodeRef.get().then((doc) => {
        if (doc.exists) {
          return doc.data().accessCode;
        } else {
          // doc.data() will be undefined in this case
          console.log("No such document!");
        }
      }).catch((error) => {
        console.log("Error getting document:", error);
      });

      // Make an HTTP request to the server url to open the locker.
      // Send the locker id and access code as query parameters.
      axios.get(
        `${serverUrl}/openLocker?lockerId=${lockerId}&accessCode=${accessCode}`
        );
    });
    */
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});


// Unsubscribe a user from a unit
export const unsubscribe = functions.https.onRequest(async (req, res) => {
  const unitId = String(req.query.unitId);
  const ownerId = String(req.query.owner);

  if (!unitId) { // Check if unitId is provided
    res.status(400).send({message: "Missing unit ID"});
    return;
  }

  if (!ownerId) { // Check if ownerId is provided
    res.status(400).send({message: "Missing owner ID"});
    return;
  }

  try {
    // get the unit document
    const unitRef = await db.collection("units").doc(unitId).get();

    // Check if the unit exists
    if (!unitRef.exists) {
      res.status(404).send({message: `Unit not found: ${unitId}`});
      return;
    }

    const unitData = unitRef.data();

    // Check if the unit has an owner
    if (!unitData || !unitData.owner) {
      res.status(404).send({message: `Owner not found for unit: ${unitId}`});
      return;
    }

    // Check if the user is the owner of the unit
    if (unitData.owner === ownerId) {
      // Await the update operation
      await db.collection("units").doc(unitId).update({
        owner: "admin",
        isAvailable: true,
      });

      // Send a response
      res.status(200).send({
        message:
          "Successfully unsubscribed from the unit",
      });
      return;
    } else {
      res.status(403).send({message: "You are not the owner of this unit"});
      return;
    }
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});

// Subscribe a user to a unit
export const subscribe = functions.https.onRequest(async (req, res) => {
  const unitId = String(req.query.unitId);
  const ownerId = String(req.query.owner);

  if (!unitId) { // Check if unitId is provided
    res.status(400).send({message: "Missing unit ID"});
    return;
  }

  if (!ownerId) { // Check if ownerId is provided
    res.status(400).send({message: "Missing owner ID"});
    return;
  }

  try {
    // get the unit document
    const unitRef = await db.collection("units").doc(unitId).get();

    // Check if the unit exists
    if (!unitRef.exists) {
      res.status(404).send({message: `Unit not found: ${unitId}`});
      return;
    }

    const unitData = unitRef.data();

    // Check if the unit has an owner
    if (!unitData || !unitData.owner) {
      res.status(404).send({message: `Owner not found for unit: ${unitId}`});
      return;
    }

    // Check if the user is the owner of the unit
    if (unitData.owner === "admin" && unitData.isAvailable) {
      // Await the update operation
      await db.collection("units").doc(unitId).update({
        owner: ownerId,
        isAvailable: false,
      });

      // Send a response
      res.status(200).send({
        message:
          "Successfully subscribed to the unit",
      });
      return;
    } else {
      res.status(403).send({message: "This unit already has an owner"});
      return;
    }
  } catch (error) {
    res.status(500).send({message: `Something went wrong: ${error}`});
  }
});
