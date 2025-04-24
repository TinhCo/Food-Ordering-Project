import React, { useState, useEffect } from "react";
import {
  Card,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  IconButton,
  Modal,
  Box,
  CardHeader,
  Pagination,
} from "@mui/material";
import { Create, Delete } from "@mui/icons-material";
import { api } from "../../config/api";
import CreateContact from "./CreateContact";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 400,
  bgcolor: "background.paper",
  boxShadow: 24,
  outline: "none",
  p: 4,
};

const ITEMS_PER_PAGE = 6;

const Contact = () => {
  const [contacts, setContacts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [openCreateContact, setOpenCreateContact] = useState(false);
  const [currentPage, setCurrentPage] = useState(1); // Trang hiện tại

  const handleOpenCreateContact = () => setOpenCreateContact(true);
  const handleCloseCreateContact = () => setOpenCreateContact(false);

  useEffect(() => {
    const fetchContacts = async () => {
      try {
        const response = await api.get("/api/contact/all");
        setContacts(response.data);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
      }
    };

    fetchContacts();
  }, []);

  const handleDelete = async (id) => {
    try {
      const token = localStorage.getItem("jwt");

      await api.delete(`/api/contact/delete/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      setContacts((prevContacts) =>
        prevContacts.filter((contact) => contact.id !== id)
      );
      toast.success("Xóa liên hệ thành công!");
    } catch (error) {
      console.error("Error deleting contact:", error);
      toast.error("Có lỗi xảy ra khi xóa liên hệ.");
    }
  };

  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentContacts = contacts.slice(indexOfFirstItem, indexOfLastItem);

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      <Card className="mt-1">
        <CardHeader
          title={"Liên hệ"}
          sx={{
            pt: 2,
            alignItems: "center",
            "& .MuiCardHeader-action": { mt: 0.6 },
          }}
          action={
            <IconButton onClick={handleOpenCreateContact}>
              <Create />
            </IconButton>
          }
        />
        <TableContainer>
          <Table aria-label="contacts table">
            <TableHead>
              <TableRow>
                <TableCell>Id</TableCell>
                <TableCell>Sender Name</TableCell>
                <TableCell>Address</TableCell>
                <TableCell>Phone</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Subject</TableCell>
                <TableCell>Content</TableCell>
                <TableCell>Reply Content</TableCell>
                <TableCell>Delete</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {currentContacts.map((contact) => (
                <TableRow key={contact.id}>
                  <TableCell>{contact.id}</TableCell>
                  <TableCell>{contact.senderName}</TableCell>
                  <TableCell>{contact.address}</TableCell>
                  <TableCell>{contact.phone}</TableCell>
                  <TableCell>{contact.email}</TableCell>
                  <TableCell>{contact.subject}</TableCell>
                  <TableCell>{contact.content}</TableCell>
                  <TableCell>
                    {contact.replyContent || "Chưa phản hồi"}
                  </TableCell>
                  <TableCell>
                    <IconButton
                      color="error"
                      onClick={() => handleDelete(contact.id)}
                    >
                      <Delete />
                    </IconButton>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
        <div className="p-4">
          <Pagination
            count={Math.ceil(contacts.length / ITEMS_PER_PAGE)}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
          />
        </div>
      </Card>
      <Modal
        open={openCreateContact}
        onClose={handleCloseCreateContact}
        aria-labelledby="create-contact-modal"
        aria-describedby="create-contact-modal-description"
      >
        <Box sx={style}>
          <CreateContact handleClose={handleCloseCreateContact} />
        </Box>
      </Modal>
    </div>
  );
};

export default Contact;
