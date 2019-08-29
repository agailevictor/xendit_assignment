import express from "express";
import dataController from "../controllers/controller";
const router = express.Router();

router.get('/:org/members', dataController.getMembers);

export default router;
