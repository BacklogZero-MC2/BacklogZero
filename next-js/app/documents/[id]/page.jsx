"use client";

import { useState, useEffect } from 'react';
import '@/app/globals.css';
import './page.css';

import Card from '@/components/Card';

const documentUrl = "http://localhost:3001/api/documents/";
const userUrl = "http://localhost:3001/api/users/";

const options = {
    method: "GET",
    headers: {
        "Content-Type": "application/json"
    }
};

const getUser = async (userId) => {
    const response = await fetch(userUrl + userId, options);
    if (!response.ok) {
        throw new Error("Network response was not ok: " + response.status);
    }
    const data = await response.json();
    return data.username;
};

const getCard = async (docId) => {
    const response = await fetch(documentUrl + docId, options);
    if (!response.ok) {
        throw new Error("Network response was not ok: " + response.status);
    }
    const data = await response.json();
    const username = await getUser(data.authorId);
    return (
        <Card
            id={docId}
            key={docId}
            className="card"
            username={username}
            n_votes={data.numOfUpvotes}
            n_comments={0}
            duration_ago="31min"
            is_bookmarked={false}
            title={data.title}
            description={data.searchableText}
        />
    );
};

const Document = ({params}) => {
    const id = params.id;
    const [card, setCard] = useState(null);
    const [error, setError] = useState(null);

    useEffect(() => {
        if (id) {
            const fetchCard = async () => {
                try {
                    const cardElement = await getCard(id);
                    setCard(cardElement);
                } catch (error) {
                    setError(error.message);
                }
            };
            fetchCard();
        }
    }, [id]);

    if (error) {
        return <div>Error: {error}</div>;
    }

    if (!card) {
        return <div>Loading...</div>;
    }

    return (
        <div className="pageMain">
            {card}
            <div className="desc">

            </div>
        </div>
    )
}

export default Document;
