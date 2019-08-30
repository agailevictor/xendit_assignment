import dataService from "../services/service";
import { notStrictEqual } from "assert";

var dataController = {
    getMembers(req, res) {
        if (req.params && req.params.org !== '') {
            var QueryStringValue = req.params.org.toLocaleLowerCase();
            dataService.handleGetMembers(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: rows.rows });
                }
            });

        } else {
            res.status(400).send("Search value cannot be empty");
        }
    },
    getComments(req, res) {
        if (req.params && req.params.org !== '') {
            var QueryStringValue = req.params.org.toLocaleLowerCase();
            dataService.handleGetComments(QueryStringValue, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: rows.rows });
                }
            });

        } else {
            res.status(400).send("Search value cannot be empty");
        }
    },
    postComments(req, res) {
        if (req.params && req.params.org !== '' && req.body && req.body.comment != '') {
            var QueryStringValue = req.params.org.toLocaleLowerCase();
            var comment = req.body.comment;
            dataService.handlePostComments(QueryStringValue, comment, function (err, rows) {
                if (err) {
                    res.status(400).send(err);
                }
                else {
                    res.status(200).json({ data: 'Successfully added new comment!' });
                }
            });
            res.status(200);

        } else {
            res.status(400).send("Search value cannot be empty");
        }
    }
};

export default dataController;