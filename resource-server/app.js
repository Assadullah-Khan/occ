import express from 'express';
import Keycloak from 'keycloak-connect';

const app = express();
const port = 3000;

// Middleware configuration loaded from keycloak.json file.
const keycloak = new Keycloak({});

app.use(keycloak.middleware());

app.get('/public', (req, res) => {
  res.json({message: 'public'});
});

app.get('/secured', keycloak.protect('realm:occ_user'), (req, res) => {
  res.json({message: 'secured'});
});

app.get('/admin', keycloak.protect('realm:occ_client'), (req, res) => {
  res.json({message: 'admin'});
});

app.use('*', (req, res) => {
  res.send('Not found!');
});

app.listen(port, () => {
  console.log(`Listening on port ${port}.`);
});
