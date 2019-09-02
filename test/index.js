import chai from "chai";
import chaiHttp from "chai-http";
import app from "../server"

var expect = chai.expect;

chai.use(chaiHttp);

describe('Test Suite 1', function () {
    it('Unit Test 1 - GET /members when org name contains white space should responds with status 400', function (done) {
        chai.request(app)
            .get("/orgs/' '/members")
            .end(function (err, res) {
                expect(res).to.have.status(400);
                done();
            });
    });
    it('Unit Test 2 - GET /comments when org name contains white space should responds with status 400', function (done) {
        chai.request(app)
            .get("/orgs/' '/comments")
            .end(function (err, res) {
                expect(res).to.have.status(400);
                done();
            });
    });
    it('Unit Test 3 - POST /comments when org name contains white space should responds with status 400', function (done) {
        chai.request(app)
            .post("/orgs/' '/comments")
            .set('content-type', 'application/json')
            .send({ comment: 'Test comment' })
            .end(function (err, res) {
                expect(res).to.have.status(400);
                done();
            });
    });
    it('Unit Test 4 - POST /comments should responds with status 200 if the API call is Valid', function (done) {
        chai.request(app)
            .post("/orgs/xendit/comments")
            .set('content-type', 'application/json')
            .send({ comment: 'Test comment' })
            .end(function (err, res) {
                expect(res).to.have.status(200);
                done();
            });
    });
});
